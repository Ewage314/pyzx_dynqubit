OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[4], q[5];
cx q[2], q[4];
cx q[2], q[5];
cx q[3], q[0];
cx q[3], q[2];
