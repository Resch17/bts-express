import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.post('/', async (req, res) => {
    const { projectid, text } = req.body;
    try {
        const result = await prisma.projectnotes.create({
            data: {
                projectid,
                text,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const { text } = req.body;
    try {
        await prisma.projectnotes.update({
            data: {
                text,
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
        await prisma.projectnotes.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
