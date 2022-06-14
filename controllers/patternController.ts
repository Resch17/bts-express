import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const patterns = await prisma.pattern.findMany({
        include: {
            category: true,
            fabrictype: true,
            file: true,
            user: true,
            publisher: true,
            patternsize: {
                select: {
                    id: true,
                    sizeid: true,
                    yards: true,
                    size: true,
                },
            },
            patternimage: {
                select: {
                    id: true,
                    patternid: true,
                    url: true,
                },
            },
            patternfile: {
                select: {
                    id: true,
                    name: true,
                    patternid: true,
                },
            },
        },
    });
    res.json(patterns);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const pattern = await prisma.pattern.findUnique({
        where: { id: Number(id) },
        include: {
            category: true,
            fabrictype: true,
            file: true,
            publisher: { select: { id: true, name: true, url: true } },
            patternfile: {
                select: {
                    id: true,
                    name: true,
                    patternid: true,
                },
            },
            patternsize: {
                select: {
                    id: true,
                    sizeid: true,
                    yards: true,
                    size: true,
                },
            },
            patternimage: {
                select: {
                    id: true,
                    patternid: true,
                    url: true,
                },
            },
            user: true,
        },
    });
    if (pattern !== null) {
        res.json(pattern);
    } else {
        res.status(404).json({ message: 'No pattern found' });
    }
});

router.post('/', async (req, res) => {
    const {
        userid,
        url,
        name,
        publisherid,
        purchasedate,
        fabrictypeid,
        notes,
        categoryid,
    } = req.body;
    try {
        const result = await prisma.pattern.create({
            data: {
                userid,
                url,
                name,
                publisherid,
                purchasedate,
                fabrictypeid,
                notes,
                categoryid,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const {
        userid,
        url,
        name,
        publisherid,
        purchasedate,
        fabrictypeid,
        notes,
        categoryid,
    } = req.body;
    try {
        await prisma.pattern.update({
            data: {
                userid,
                url,
                name,
                publisherid,
                purchasedate,
                fabrictypeid,
                notes,
                categoryid,
            },
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.pattern.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
