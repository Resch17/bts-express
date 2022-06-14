import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const projects = await prisma.project.findMany({
        include: {
            pattern: true,
            user: true,
            projectstatus: {
                select: {
                    id: true,
                    name: true,
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
        },
    });
    res.json(projects);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const project = await prisma.project.findUnique({
        where: { id: Number(id) },
        include: {
            pattern: true,
            user: true,
            projectstatus: {
                select: {
                    id: true,
                    name: true,
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
        },
    });
    if (project !== null) {
        res.json(project);
    } else {
        res.status(404).json({ message: 'No project found' });
    }
});

router.post('/', async (req, res) => {
    const { name, userid, patternid, patternsizeid, projectstatusid } =
        req.body;
    try {
        const result = await prisma.project.create({
            data: {
                name,
                userid,
                patternid,
                patternsizeid,
                projectstatusid,
                createdatetime: new Date(),
                iscomplete: false,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        console.error(err);
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const {
        name,
        userid,
        patternid,
        patternsizeid,
        projectstatusid,
        iscomplete,
    } = req.body;
    try {
        await prisma.project.update({
            data: {
                name,
                userid,
                patternid,
                patternsizeid,
                projectstatusid,
                iscomplete,
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
        await prisma.project.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
