OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[3], q[4];
cx q[3], q[2];
x q[0];
cx q[3], q[4];
cx q[1], q[0];
cx q[0], q[4];
